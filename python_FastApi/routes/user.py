from fastapi import APIRouter
from config.db import conn
from schemas.user import users
from models.user import UserModel
from sqlalchemy.exc import SQLAlchemyError

user=APIRouter()

@user.get("/")
def fetch_users():
    # Realiza una consulta a la base de datos para obtener todos los usuarios
    result = conn.execute(users.select()).fetchall()
    
    # Convierte el resultado de la consulta en una lista de diccionarios
    users_list = [row._asdict() for row in result]
    
    return users_list

@user.post("/create")
def create_user(user: UserModel):
    try:
        conn.execute(users.insert().values(name=user.name, email=user.email, password=user.password))
        conn.commit()  # Commit the changes
        return {"message": "User created successfully"}
    except SQLAlchemyError as e:
        # Log the error and potentially return an error response
        print(f"Error inserting user: {e}")
        return {"error": "Failed to create user"}

@user.put("/{id}")
def update_user(id:int,user:UserModel):
    return conn.execute(users.update().values(name=user.name,email=user.email,password=user.password).where(users.c.id==id))
                        
                        
@user.delete("/{id}")
def delete_user(id:int):
    return conn.execute(users.delete().where(users.c.id==id))
