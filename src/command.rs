//! The Command struct represents the action indicated by the user via args from the command line
//! 
//! # Examples
//! 
//! ```
//! let test_command = soji::command::Command { name: "Test Name".to_string(), args: vec![] };
//! assert_eq!(test_command.name, "Test Name".to_string());
//! ```
pub struct Command {
    pub name: String,
    pub args: Vec<String>
}

pub fn command_from_args(args: Vec<String>) -> Command {
    if args.len() < 1 {
        Command { name: "status".to_string(), args: vec![] }
    } else if args.len() == 1 {
        Command { name: args[0].to_string(), args: vec![] }
    } else {
        Command { name: args[0].to_string(), args: args[1..].to_vec() }
    }
}
