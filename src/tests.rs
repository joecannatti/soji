#[cfg(test)]
use super::commands;

#[test]
fn command_factory_has_command_name() {
    let command_factory = commands::CommandFactory { command_name: "Test name".to_string(), args: vec![] };
    assert_eq!(command_factory.command_name, "Test name");
}
