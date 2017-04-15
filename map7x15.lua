return {
  version = "1.1",
  luaversion = "5.1",
  tiledversion = "0.17.0",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 7,
  height = 15,
  tilewidth = 60,
  tileheight = 60,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "1",
      firstgid = 1,
      tilewidth = 60,
      tileheight = 60,
      spacing = 0,
      margin = 0,
      tileoffset = {
        x = 0,
        y = 0
      },
      properties = {},
      terrains = {},
      tilecount = 3,
      tiles = {
        {
          id = 0,
          image = "../Tiled/Images/1.png",
          width = 60,
          height = 60
        },
        {
          id = 1,
          image = "../Tiled/Images/2.png",
          width = 60,
          height = 60
        },
        {
          id = 2,
          image = "../Tiled/Images/3.png",
          width = 60,
          height = 60
        }
      }
    }
  },
  layers = {
    {
      type = "tilelayer",
      name = "Слой тайлов 1",
      x = 0,
      y = 0,
      width = 7,
      height = 15,
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        3, 3, 2, 2, 2, 3, 3,
        1, 2, 1, 1, 1, 2, 1,
        1, 2, 1, 1, 1, 2, 1,
        3, 1, 3, 1, 3, 1, 3,
        2, 2, 3, 1, 3, 2, 2,
        1, 1, 2, 3, 2, 1, 1,
        1, 3, 1, 2, 1, 3, 1,
        3, 1, 1, 1, 1, 1, 3,
        1, 1, 3, 1, 3, 1, 1,
        3, 1, 1, 3, 1, 1, 3,
        3, 3, 2, 1, 2, 3, 3,
        3, 1, 1, 2, 1, 1, 3,
        1, 1, 3, 1, 3, 1, 1,
        3, 3, 1, 1, 1, 3, 3,
        1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "tilelayer",
      name = "Слой тайлов 2",
      x = 0,
      y = 0,
      width = 7,
      height = 15,
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        3, 3, 2, 2, 2, 3, 3,
        1, 1, 1, 1, 1, 1, 1,
        1, 3, 2, 2, 2, 3, 1,
        1, 3, 1, 3, 1, 3, 1,
        3, 3, 1, 2, 1, 3, 3,
        1, 1, 2, 1, 2, 1, 1,
        2, 3, 3, 1, 3, 3, 2,
        2, 1, 1, 3, 1, 1, 2,
        1, 3, 1, 3, 1, 3, 1,
        3, 1, 2, 2, 2, 1, 3,
        3, 1, 3, 1, 3, 1, 3,
        1, 3, 1, 1, 1, 3, 1,
        1, 1, 2, 2, 2, 1, 1,
        1, 3, 3, 1, 3, 3, 1,
        3, 1, 1, 1, 1, 1, 3
      }
    },
    {
      type = "tilelayer",
      name = "Слой тайлов 3",
      x = 0,
      y = 0,
      width = 7,
      height = 15,
      visible = false,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        3, 3, 2, 2, 2, 3, 3,
        1, 1, 1, 1, 1, 1, 1,
        1, 3, 1, 3, 1, 3, 1,
        3, 3, 2, 3, 2, 3, 3,
        1, 3, 1, 3, 1, 3, 1,
        2, 2, 2, 3, 3, 3, 2,
        1, 3, 1, 3, 1, 3, 1,
        3, 3, 2, 3, 2, 3, 2,
        1, 3, 1, 3, 1, 3, 1,
        2, 2, 1, 2, 2, 3, 2,
        1, 3, 3, 3, 1, 2, 1,
        3, 3, 2, 1, 2, 3, 2,
        1, 3, 3, 3, 3, 3, 1,
        2, 3, 2, 3, 2, 3, 2,
        1, 1, 1, 1, 1, 1, 1
      }
    },
    {
      type = "tilelayer",
      name = "Слой тайлов 4",
      x = 0,
      y = 0,
      width = 7,
      height = 15,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        3, 3, 2, 2, 2, 3, 3,
        1, 2, 1, 1, 1, 2, 1,
        1, 3, 2, 2, 2, 3, 1,
        1, 3, 1, 1, 1, 3, 1,
        2, 1, 3, 3, 3, 1, 2,
        3, 1, 1, 2, 1, 1, 3,
        1, 2, 3, 1, 3, 2, 1,
        1, 1, 1, 1, 1, 1, 1,
        1, 3, 1, 3, 1, 3, 1,
        2, 1, 3, 3, 3, 1, 2,
        2, 2, 1, 1, 1, 2, 2,
        3, 1, 3, 2, 3, 1, 3,
        3, 3, 1, 1, 1, 3, 3,
        3, 2, 1, 1, 1, 2, 3,
        3, 2, 1, 1, 1, 2, 3
      }
    }
  }
}
