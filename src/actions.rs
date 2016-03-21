use super::command;
use super::datastore;

pub trait Action {
    fn execute(&self) -> Result<bool, String>;
}

pub struct StartTaskAction {
    pub task_name: String
}

impl Action for StartTaskAction {
    fn execute(&self) -> Result<bool, String> {
        let details = vec![self.task_name.to_string()];
        let name = "start".to_string();
        datastore::store_event(name, details).expect("Write failed");
        Ok(true)
    }
}

pub enum Actions {
    StartTaskAction(StartTaskAction)
}

pub struct ActionFactory;

impl ActionFactory {
    pub fn action_for_command(command: command::Command) -> Actions {
        Actions::StartTaskAction(StartTaskAction {task_name: command.args[0].to_string()})
    }
}
