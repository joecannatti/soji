use std::io;
use std::fs;
use std::io::Write;
use std::io::BufReader;
use std::io::BufRead;

pub fn store_event(name: String, details: Vec<String>) -> io::Result<()> {
    let mut f = try!(fs::File::create("/tmp/data.csv"));
    let mut row_data = details.to_vec();
    row_data.insert(0, name);
    let row_string = row_data.join(",");
    try!(f.write_all(row_string.as_bytes()));
    try!(f.write_all("\n".as_bytes()));
    Ok(())
}

pub fn current_task() -> Result<String, String>{
    let f = fs::File::open("/tmp/data.csv").expect("read failed");
    let f = BufReader::new(f);
    let mut event_line : String = "".to_string();
    for line in f.lines() {
        let line_copy = line.unwrap();
        if line_copy[..5] == "start".to_string() {
            event_line = line_copy.to_string().split(",").nth(0).expect("not found").to_string();
        }
    }
    Ok(event_line)
}
