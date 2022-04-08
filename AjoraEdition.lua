Script.properties({
  name = 'Ajora Edition',
  description = 'Changes specific to the modpack',
  author = 'Nax',
  version = '0.0.0'
})
-- Battle Panel Texture Draw Size
Patch.write16(0x08a999dc, 0x3c)
Patch.write16(0x08a999de, 0x3c)
Patch.write16(0x08a99a0c, 0x3c)
Patch.write16(0x08a99a0e, 0x3c)
Patch.write16(0x08a99a84, 0x3c)
Patch.write16(0x08a99a86, 0x3c)
Patch.write16(0x08a99acc, 0x3c)
Patch.write16(0x08a99ace, 0x3c)

-- HP digits
Patch.write16(0x08a99c24, 0x04)
Patch.write16(0x08a99c9c, 0x04)
Patch.write16(0x08a99d14, 0x04)
Patch.write16(0x08a99d74, 0x04)
Patch.write16(0x08aec568, 0x04)

-- HP max X offset
Patch.write16(0x08a99c28, 0x12)
Patch.write16(0x08a99ca0, 0x12)
Patch.write16(0x08a99d18, 0x12)
Patch.write16(0x08a99d78, 0x12)
Patch.write16(0x08aec56c, 0x22)

-- HP max digits
Patch.write16(0x08a99c30, 0x1004)
Patch.write16(0x08a99ca8, 0x1004)
Patch.write16(0x08a99d20, 0x1004)
Patch.write16(0x08a99d80, 0x1004)
Patch.write16(0x08aec574, 0x1004)

-- Enlarge Battle Panel Texture
Patch.write16(0x0891a020, 0x3c)
Patch.write16(0x0891a860, 0x3c)

Patch.write16(0x089bcd38, 0x54)

-- Enlarge Battle Panel Texture Buffer
Patch.write16(0x0891a840, 0x900)
Patch.write16(0x0891a850, 0x900)
Patch.write16(0x0891a8c4, 0x600)
Patch.write16(0x0891a8ec, 0x600)
Patch.write16(0x0891a91c, 0x600)
Patch.write16(0x0891a95c, 0x600)
Patch.write16(0x0891a974, 0x600)

Patch.write16(0x089bcd28, 0x900)
Patch.write16(0x089bcd74, 0x600)
Patch.write16(0x089bcd94, 0x600)
Patch.write16(0x089bc268, 0x54)

-- DEBUG - 10x stats divisor
Patch.write16(0x088c4370, 10)

-- Max HP 9999
Patch.write16(0x088c437c, 9999)

Patch.write16(0x088c5718, 10000)
Patch.write16(0x088c5724, 9999)

Patch.write16(0x089a09b0, 10000)
Patch.write16(0x089a09bc, 9999)
Patch.write16(0x089a09c8, 10000)
Patch.write16(0x089a09d4, 9999)

-- Unit Roster Fixes
Patch.write16(0x0898bccc, 10000)
Patch.write16(0x0898bcd8, 9999)
Patch.write16(0x0898bce4, 10000)
Patch.write16(0x0898bcf0, 9999)

-- Roster DrawNumberParams
Patch.write16(0x08b16fd4, 0x04)
Patch.write16(0x08b16fd8, 0x22)
Patch.write16(0x08b16fe0, 0x1004)

Patch.write16(0x08b17050, 0x22)
Patch.write16(0x08b17058, 0x1004)

Patch.write16(0x089e2928, 0x54)
Patch.write16(0x089e33fc, 0x54)

Patch.write16(0x089e33f8, 0x900)
Patch.write16(0x089e34e4, 0x600)
Patch.write16(0x089e3504, 0x600)

local rosterOnCharacterValueWrapper = ASM.new([[
  la v0, 0x0944f0d8
  lw v0, 0(v0)
  bnez v0, isNotHP
   nop

isHP:
  b   end
   li at, 4

isNotHP:
  li at, 3

end:
  la v0, 0x08ADFBE0
  sb at, 0(v0)

  la v0, 0x08ADFB54
  j 0x08987380
   sb at, 0(v0)
]])
ASM.patch(0x089849b8, "jal " .. rosterOnCharacterValueWrapper)
