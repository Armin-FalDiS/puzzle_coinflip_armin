program puzzle_coinflip_armin.aleo;



mapping flip_history:
	key as u16.public;
	value as boolean.public;


mapping total_flips:
	key as boolean.public;
	value as u16.public;


function flip:
    async flip into r0;
    output r0 as puzzle_coinflip_armin.aleo/flip.future;

finalize flip:
    rand.chacha into r0 as boolean;
    get.or_use total_flips[false] 0u16 into r1;
    set r0 into flip_history[r1];
    add r1 1u16 into r2;
    set r2 into total_flips[false];

