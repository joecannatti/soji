use std::io;
use std::fs;
use std::io::Write;

pub fn store_event(name: String, details: Vec<String>) -> io::Result<()> {
    let mut f = try!(fs::File::create("/tmp/data.csv"));
    let mut row_data = details.to_vec();
    row_data.insert(0, name);
    let row_string = row_data.join(",");
    try!(f.write_all(row_string.as_bytes()));
    Ok(())
}
