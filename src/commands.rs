pub struct CommandFactory {
    pub command_name: String,
    pub args: Vec<String>
}

impl CommandFactory {
    pub fn create_command(&self) -> String {
        "aoeu".to_string()
    }
}
