program puzzle_coinflip_armin.aleo {
  mapping flip_history: u16 => bool;
  mapping total_flips: bool => u16;

  async transition flip() -> Future {
    return store_flip();
  }

  async function store_flip() {
    let result: bool = ChaCha::rand_bool();

    let current_total: u16 = Mapping::get_or_use(total_flips, false, 0u16);
    Mapping::set(flip_history, current_total, result);
    Mapping::set(total_flips, false, current_total + 1u16);
  }
}
