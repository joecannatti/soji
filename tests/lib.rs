extern crate soji;

#[test]
fn it_can_create_a_command() {
    let test_command = soji::command::Command { name: "Test Name".to_string(), args: vec![] };
    assert_eq!(test_command.name, "Test Name".to_string());
}
