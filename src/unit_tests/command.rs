use ::command;

#[test]
fn it_has_a_name() {
    let test_command = command::Command { name: "Test Name".to_string(), args: vec![] };
    assert_eq!(test_command.name, "Test Name".to_string());
}

#[test]
fn command_from_args_puts_the_head_into_name() {
    let args = vec!["start".to_string(), "Write Args Parser".to_string()];
    assert_eq!(command::command_from_args(args).name, "start");
}

#[test]
fn command_from_args_puts_the_tail_into_the_args() {
    let args = vec!["start".to_string(), "Write Args Parser".to_string(), "Panda".to_string()];
    let results = command::command_from_args(args);
    assert_eq!(results.args[0], "Write Args Parser");
    assert_eq!(results.args[1], "Panda");
}

#[test]
fn command_from_args_command_but_not_args() {
    let args = vec!["start".to_string()];
    let results = command::command_from_args(args);
    assert_eq!(results.args.len(), 0);
}
