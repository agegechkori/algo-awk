## Board Game XO
There are orbs on an `NxM` board (`O` denotes an orb and `X` denotes an empty slot). Whenever two orbs are in the same column or the same row, you get to erase one of them.

Try to erase as many orbs as possible. Find the minimum number of orbs remained on board eventually.

E.g.

    OXOXXO
    XXXXXO
    XXXXOX

    erase (0,0) and get

    XXOXXO
    XXXXXO
    XXXXOX

    erase (2,0) and get

    XXXXXO
    XXXXXO
    XXXXOX

    erase (5,0) and get

    XXXXXX
    XXXXXO
    XXXXOX

    no more moves available. Return 2.

E.g.

    OXOXXO
    XXXXXO
    XXOXOX

    erase(4,2), (2,2), (0,0), (2,0), (5,0).

    Return 1.

E.g.

    OXOXXX
    XOXXXO
    XXXOOX

    erase(0,0), (1,1), (3,2).

    Return 3.

**Follow-up.** Build a solver for this board game that erases as many orbs as possible.