package be.optis.favor.mongoload.web.controller;

import be.optis.favor.mongoload.model.Pet;
import be.optis.favor.mongoload.repository.PetRepository;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/pets")
public class PetController {
    @Autowired
    private PetRepository repository;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public List<Pet> getAllPets() {
        return repository.findAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public Pet getPetById(@PathVariable("id") ObjectId id) {
        return repository.findBy_id(id);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT)
    public void modifyPetById(@PathVariable("id") ObjectId id, @Valid @RequestBody Pet pet) {
        pet.set_id(id);
        repository.save(pet);
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    public Pet createPet(@Valid @RequestBody Pet pet) {
        pet.set_id(ObjectId.get());
        repository.save(pet);
        return pet;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public void deletePet(@PathVariable ObjectId id) {
        repository.delete(repository.findBy_id(id));
    }
}
