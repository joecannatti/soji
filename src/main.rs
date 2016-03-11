extern crate soji;

use soji::command;

fn main() {
    let command = command::Command {name: "Start Task".to_string(), args: vec![]};
    println!("Command {}", command.name);
}
