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

# tiles:
# @ player
# # wall
# $ crate
# . spot
# + player on spot
# * crate on spot
MovSet ← ["$ "_" $"
          "$."_" *"
          "* "_".$"
          "*."_".*"
          "@ "_" @"
          "+ "_".@"
          "@."_" +"
          "+."_".+"]
# cmd lvl -- lvl
Mov ← (
  ⊡∶[¯1_0 0_1 1_0 0_¯1]            # dir lvl
  ⊙(♭⊜∘♭∶/⊂⇡△.+⊃(⌕@@)(⌕@+).)       # dir player_yx lvl
  ⊡,,⍉+⍉⊞×⇡3                       # chars yx_list lvl
  ⍜'↘1(?(;∶⊡1⊢)(;)>0⧻.▽∊⊙.,MovSet) # chars yx_list lvl
  ⍜'↙2(?(;∶⊡1⊢)(;)>0⧻.▽∊⊙.,MovSet) # chars yx_list lvl
  ⍜⊙⊡∘                             # lvl
)
# note: add bounds check

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
