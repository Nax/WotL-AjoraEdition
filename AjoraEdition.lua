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

-- HP max X offset
Patch.write16(0x08a99c28, 0x12)
Patch.write16(0x08a99ca0, 0x12)
Patch.write16(0x08a99d18, 0x12)
Patch.write16(0x08a99d78, 0x12)

-- HP max digits
Patch.write16(0x08a99c30, 0x1004)
Patch.write16(0x08a99ca8, 0x1004)
Patch.write16(0x08a99d20, 0x1004)
Patch.write16(0x08a99d80, 0x1004)

-- Enlarge Battle Panel Texture
ASM.patch(0x0891a020, "li v0, 0x3c")
ASM.patch(0x0891a860, "li v1, 0x3c")

-- Enlarge Battle Panel Texture Buffer
ASM.patch(0x0891a840, "li a0, 0x900")
ASM.patch(0x0891a850, "li a1, 0x900")
ASM.patch(0x0891a8c4, "addiu a0, v0, 0x600")
ASM.patch(0x0891a8ec, "addiu a0, v0, 0x600")
ASM.patch(0x0891a91c, "addiu a0, v0, 0x600")
ASM.patch(0x0891a95c, "addiu a0, v0, 0x600")
ASM.patch(0x0891a974, "addiu a1, v0, 0x600")


-- DEBUG - 10x stats divisor
ASM.patch(0x088c4370, "li s7, 10")

-- Max HP 9999
ASM.patch(0x088c437c, "li s3, 9999")

ASM.patch(0x088c5718, "sltiu at, v0, 10000")
ASM.patch(0x088c5724, "li v0, 9999")

ASM.patch(0x089a09b0, "slti v0, v1, 10000")
ASM.patch(0x089a09bc, "li v1, 9999")
ASM.patch(0x089a09c8, "slti v0, v1, 10000")
ASM.patch(0x089a09d4, "li v1, 9999")
