The 1st project of learning game dev

Why and What lua
classes and externel lib used
love 2d and most used cmd 
colision detection : AABB
audio


*What and why lua
lua (moon in Portuguese) is a lightweight scripting laguage, easy to embleme with c/c++ and easier to learn(only 21 keyword), It is widely used in game development, scripting, and automation, some stuffs that i want ro become decent in

*classes and external libs used during this projects and future one 
Lua doesn't have a build-in support for classes, but i can implement OOP using tables and metatables
in short for a no brainer:
start your classe with this
class_name = {}
and then work as you wish with it
function class_name:init(x)
    self.x = x
end

-> new libs used this project
class => not having full control over metatable , but cleaner,easier to read and to maintain
push => to haandle scaling and screen resultion in a more managable way

*love2d
an open-source  lua framwork to work mainly on 2d games :), good for prototyping and/or making games
most used love2d modules used until now :
love.graphics.
    ->setdefaultfilter => set afileter (usually nearest) to everything i will draw later on
    ->newfont/setfont => to init a font/select a font i will work with (need to have the font)
    ->clear => color the full screen with a color
    ->printf to prit something on the console
love.windows.
    ->settitle , do i really need to explain that too ?
    ->setmode => to init windows dimention and some settings

love.evemt. => close windoes and andle keypresses ..

*Simple colision detection : AABB
to check colition between the paddls and the ball i used the simple AABB (Axis-Aligned Bounding Box) , is it a method to check if 2 rectangle shape object colide or overlap
it check each side of the of the rectengle 1 with the inverse side of the rectange 2 if all of them are false that mean we have a colition
=> graphic exemple coming soon

*audio
