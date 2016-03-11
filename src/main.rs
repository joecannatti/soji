extern crate soji;

use soji::commands;

fn main() {
    let command_factory = commands::CommandFactory {command_name: "Start Task".to_string(), args: vec![]};
    println!("Event {}", command_factory.create_command());
}
