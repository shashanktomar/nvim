# Practice Routine

- flash
  - [ ] start using labelled search
  - [x] start using jump labels, `s`
  - [ ] start using treesitter selection `S`
    - it only suggest object upward and not downward from selection
    - `;` and `,` in this behave weird
  - [ ] start using `yR` (Treesitter Search). This is super cool
  - [ ] start using `yr` (remote mode). This is even more cooler
    - it is three step: initiate, goto, perform. After initiate and goto, you are already in operator pending mode.
    - examples
      - yank text without loosing cursor
        - press `yr` to initiate
        - find i.e. look where you want to go and type few characters
        - perform any motion, like iw or even start flash Treesitter with S
        - the yank will be performed on the new selection
        - you'll be back in the original window / position

