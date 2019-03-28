package be.optis.favor.mongoload.repository;

import be.optis.favor.mongoload.model.Pet;
import org.bson.types.ObjectId;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface PetRepository extends MongoRepository<Pet, String> {
    Pet findBy_id(ObjectId _id);
}
