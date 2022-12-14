#version 330 

layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;

out vec3 FragPos; 
out vec3 Normal;

uniform mat4 projection;
uniform mat4 view;
uniform mat4 model;


void main(){
   gl_Position = projection * view * model * vec4(aPos,1.0);
   FragPos = vec3(model *  vec4(aPos, 1.0f));
   //Technically we should calculate this on CPU but its fine for my purposes
   Normal = mat3(transpose(inverse(model))) * aNormal;  
}
