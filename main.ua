# file -- lvl
Load ← (
  ⊜□≠,@;&fras
  ⊐∵(↘1⬚@ ⊐⊜∘≠,@\n)
)

# -- cmd
Cmd ← (|0
  ⊙;⊢⍥(
    +×32×⊃(≥@A)(≤@Z). &rs 1 0      # char
    ⊚∊⊢∶["wk8" "dl6" "sj2" "ah4"]. # [mov] char
    ;⎋>0⧻.                         # char (ret mov)
    ⊚∊⊢∶["qq" "rr" "\r\n"].        # [meta] char
    ;;⎋>0⧻.¯+1                     # (ret meta)
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
  ⊡∶[¯1_0 0_1 1_0 0_¯1]          # dir lvl
  ⊙(♭⊜∘♭∶/⊂⇡△.+⊃(⌕@@)(⌕@+).)     # dir player_yx lvl
  ⍉-×⊓'<0△,,+⍉⊞×⇡3               # yx_list lvl
  ⬚@#⊡,,                         # chars yx_list lvl
  ⍜'↘1(?(;∶⊡1⊢);>0⧻.▽∊⊙.,MovSet) # chars yx_list lvl
  ⍜'↙2(?(;∶⊡1⊢);>0⧻.▽∊⊙.,MovSet) # chars yx_list lvl
  ⊙;⍜⊙⊡∘ ∩↙,∶⊗@#.                # lvl
)
# bounds checking at the end takes advantage of the fact
# that nothing can happen when @# first appears.
# would be easier with ⍜⬚@#⊡

# lvl -- win
Win ← ¬/↥∊@$

# lvl --
Draw ← &pf↯∶@\n;≡(&p.&pf@ )∶↥0-⊢△,⊢&ts

# lvl --
Game ← (|1.0
  .
  ⍥(
    Draw.
    <0.Cmd
    ?(
      # meta
      -1¯
      (⎋1|.;)
    ) (
      # move
      Mov
      ?(⎋1&p"## You win!")∘ Win.
    )
  )∞
  ;;
)

# lvldir --
Menu ← (|1.0
  0_0⧻. # [cursor lvlnum] lvllen lvldir
  ⍥(
    &p "uiua-sokoban"
    {"  level" "  quit"}
    ⍜(⊢⊔⊡)(@>;)⊢,
    ⍜(⊔⊢)(⊂∶$" < _ >"+1⊢⇌,)
    ;⊐≡(&p.)
    &pf↯∶@\n-3⊢&ts
    =¯3.Cmd
    ?(⎋(0⊃(Game⊔⊡⊙;⊢⇌)(⊙⊙∘)|1)⊢.;)(
      ↧⊃(≤3)(≥0).
      ?(+⊡∶[¯1_0 0_1 1_0 0_¯1]);
      ◿⊂2,
    )
  )∞
  ;;;
)

# Main
&raw1
Menu Load "microban.txt"
