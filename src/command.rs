//! THe Command struct represents the action indicated by the user
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
