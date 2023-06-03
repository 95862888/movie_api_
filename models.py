from sqlalchemy import Column, String, Float, Text
from sqlalchemy.orm import declarative_base

Base = declarative_base()

class Movie(Base):
    __tablename__ = "movies"
    id = Column(String, primary_key=True)
    title = Column(String)
    description = Column(Text)
    rating = Column(Float)
    poster = Column(String)

    def __init__(self, id, title, description, rating, poster):
        self.id = id
        self.title = title
        self.description = description
        self.rating = rating
        self.poster = poster