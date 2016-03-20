use ::actions;
use ::command;

#[test]
fn it_returns_a_start_task_action_for_the_start_command() {
    let test_command = command::Command { name: "start".to_string(), args: vec!["panda".to_string()] };
    let action = actions::ActionFactory::action_for_command(test_command);
    match action {
        actions::Actions::StartTaskAction(start_action) => assert_eq!(start_action.task_name, "panda")
    }
}