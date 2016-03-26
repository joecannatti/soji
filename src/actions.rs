use super::command;
use super::datastore;


pub trait Action {
    fn execute(&self) -> Result<String, String>;
}

pub struct StartTaskAction {
    pub task_name: String
}

pub struct StatusAction {
    pub current_task: String
}

impl Action for StartTaskAction {
    fn execute(&self) -> Result<String, String> {
        let details = vec![self.task_name.to_string()];
        let name = "start".to_string();
        datastore::store_event(name, details).expect("Write failed");
        Ok("success".to_string())
    }
}

impl Action for StatusAction {
    fn execute(&self) -> Result<String, String> {
        datastore::current_task()
    }
}

pub enum Actions {
    StartTaskAction(StartTaskAction),
    StatusAction(StatusAction)
}

pub struct ActionFactory;

impl ActionFactory {
    pub fn action_for_command(command: command::Command) -> Actions {
        if command.name == "start" {
            Actions::StartTaskAction(StartTaskAction {task_name: command.args[0].to_string()})
        } else {
            Actions::StatusAction(StatusAction { current_task: "".to_string()})
        }
    }
}
