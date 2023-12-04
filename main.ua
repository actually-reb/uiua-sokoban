# file -- lvl
Load ← (
  ⊜□≠,@;&fras
  ⊐∵(↘1⬚@ ⊜∘≠,@\n)
)

CmdList ← ["\r\n\n" "rrr" "qqq" "wk8" "dl6" "sj2" "ah4"]
CmdMeta ← 3
# -- cmd
Cmd ← (|0
  ⊢⍢(;)(
    +×32×⊃(≥@A)(≤@Z). &rs 1 0 # char
    -CmdMeta⊚∊⊢:CmdList       # [mov]
    =0⧻.                      # loop [mov]
  )
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
  ⊡:[¯1_0 0_1 1_0 0_¯1]           # dir lvl
  ⊙(♭⊜∘♭:/⊂⇡△.+⊃(⌕@@)(⌕@+).)      # dir player_yx lvl
  ⍉-×⊓(<0)△,,+⍉⊞×⇡3               # yx_list lvl
  ⬚@#⊡,,                          # chars yx_list lvl
  ⍜(↘1)((;|;:⊡1⊢)>0⧻.▽∊⊙.,MovSet) # chars yx_list lvl
  ⍜(↙2)((;|;:⊡1⊢)>0⧻.▽∊⊙.,MovSet) # chars yx_list lvl
  ⊙;⍜⊙⊡∘ ∩↙,:⊗@#.                 # lvl
)
# bounds checking at the end takes advantage of the fact
# that nothing can happen when @# first appears.
# would be easier with ⍜⬚@#⊡

# lvl -- win
Win ← ¬/↥∊@$

# lvl --
Draw ← &pf↯:@\n;≡(&p.&pf@ ):↥0-⊢△,⊢&ts

# lvl --
Game ← (|1.0
  .
  ⍢()(
    Draw.
    <0.Cmd
    (
      # move
      Mov
      (1|0&p"## You win!") Win.
    | # meta
      -1¯
      (0|1.;)
    )
  )
  ;;
)

# lvldir --
Menu ← (|1.0
  0_0⧻. # [cursor lvlnum] lvllen lvldir
  ⍢()(
    &p "uiua-sokoban"
    {"  level" "  quit"}
    ⍜(⊢⊔⊡)(@>;)⊢,
    ⍜(⊔⊢)(⊂:$" < _ >"+1⊢⇌,)
    ;⊐≡(&p.)
    &p ""
    &p "INSTRUCTIONS:"
    &p " wasd, hjkl, or numpad to move"
    &p " r - restart"
    &p " q - quit"
    &p " enter - menu option"
    &pf↯:@\n-9⊢&ts
    =¯3.Cmd
    (
      ↧⊃(≤3)(≥0).
      (;|+⊡:[¯1_0 0_1 1_0 0_¯1])
      ◿⊂2,
      1
    | (1⊃(Game⊔⊡⊙;⊢⇌)(⊙⊙∘)|0)⊢.;
    )
  )
  ;;;
)

# Main
&raw1
Menu Load "microban.txt"
