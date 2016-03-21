extern crate soji;

use std::env;
use soji::command;
use soji::actions;
use soji::actions::Action;

fn main() {
    let mut user_args : Vec<String> = env::args().collect();
    user_args.remove(0);

    let command = command::command_from_args(user_args);
    let action = actions::ActionFactory::action_for_command(command);
    match action {
        actions::Actions::StartTaskAction(start_action) => start_action.execute()
    }.expect("action failed");
}
