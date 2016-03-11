use ::command;

#[test]
fn it_has_a_name() {
    let test_command = command::Command { name: "Test Name".to_string(), args: vec![] };
    assert_eq!(test_command.name, "Test Name".to_string());
}
