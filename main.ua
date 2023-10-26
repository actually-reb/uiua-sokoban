Lvl ← ["    @      "
       "  ##   ####"
       "       ####"]

# file -- lvl
Load ← (
  ⊢⊜□≠,@;&fras
  ↘1⬚@ ⊐⊜∘≠,@\n
)

Cmd ← (|0
  ⊢⍥(
    +×32×⊃(≥@A)(≤@Z). &rs 1 0
    ⊚∊⊢∶["wk8" "dl6" "sj2" "ah4"]
    ;⎋>0⧻.
  )∞
)

# cmd lvl -- lvl
Mov ← (
  ⊡∶[¯1_0 0_1 1_0 0_¯1]   # dir lvl
  ⊙∶+,⊙(♭⊜∘♭∶/⊂⇡△.⌕@@.)   # new_yx lvl player_yx
  ≠@ ⬚@#⊡-×<0,△,,,        # is_blocked new_yx lvl player_yx
  ?(;∶;)(⍜⊡(@ ;)∶⍜⊡(@@;)) # lvl
)

Draw ← &pf↯+1∶@\n;≡(&p.)∶↥0-⊢△,⊢&ts

Main ← (|0.0
  &raw1
  Load "microban.txt"
  ⍥(
    Draw.
    Mov Cmd.
  )∞
)

Main
