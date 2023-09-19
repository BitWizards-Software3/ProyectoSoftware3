from fastapi import APIRouter
from config.db import conn
from models.user import users
from schemas.user import User
from sqlalchemy.exc import SQLAlchemyError
user = APIRouter()

@user.get("/")
def fetch_users():
    result_set = conn.execute(users.select()).fetchall()
    # Assuming users.select() returns a selection with columns 'id', 'name', 'email'
    users_list = [{"id": result[0], "name": result[1], "email": result[2]} for result in result_set]
    return users_list

@user.post("/create")
def create_user(user: User):
    try:
        conn.execute(users.insert().values(name=user.name, email=user.email, password=user.password))
        conn.commit()  # Commit the changes
        return {"message": "User created successfully"}
    except SQLAlchemyError as e:
        # Log the error and potentially return an error response
        print(f"Error inserting user: {e}")
        return {"error": "Failed to create user"}

@user.put("/{id}")
def update_user(id: int, user: User):
    conn.execute(users.update().values(name = user.name, email = user.email, password = user.password).where(users.c.id == id))
    conn.commit()
    return {"message" : "User updated successfully"}
    

@user.delete("/{id}")
def delete_user(id: int):
    conn.execute(users.delete().where(users.c.id == id))
    conn.commit()
    return {"message" : "User deleted successfully"}

