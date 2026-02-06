use std::{cell::*, ops::ControlFlow::*};

fn increment_string(s: &str) -> String {
    let mut v = [s.as_bytes(), b"0"].concat();
    match
        Cell::from_mut(&mut v[..])
        .as_slice_of_cells()
        .windows(2)
        .try_rfold(None, |a, w| {
            match w[0].get() {
                b'9' => {
                    w[0].set(b'0');
                    Continue(a)
                }
                b if b.is_ascii_digit() => {
                    w[0].set(b + 1);
                    Break(a)
                }
                _ => Break(Some(&w[1]))
            }
        })
    {
        Continue(_) => v[0] = b'1',
        Break(Some(c)) => c.set(b'1'),
        _ => { v.pop(); }
    }
    unsafe { String::from_utf8_unchecked(v) }
}
