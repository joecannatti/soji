use super::command;

pub trait Action {
    fn execute(&self) -> ();
}

pub struct StartTaskAction {
    pub task_name: String
}

impl Action for StartTaskAction {
    fn execute(&self) -> () {
        println!("Start Action Executed");
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
