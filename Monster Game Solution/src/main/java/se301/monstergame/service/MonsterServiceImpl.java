package se301.monstergame.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import se301.monstergame.model.Monster;

@Service("monsterService")
public class MonsterServiceImpl implements MonsterService {

	private static MongoOperations mongoOps;
	
	private static List<Monster> list = new ArrayList<Monster>();
	
	private static long id = 100000;
	/*static {
		try {
			String address = "127.0.0.1:27017";
			String dbname = "monstergame";
			mongoOps = new MongoTemplate(new MongoClient(new DBAddress(address)), dbname);
		} catch (UnknownHostException e) {
			e.printStackTrace();
			System.out.println("Is MongoDB running ?");
		}
	}*/

	public List<Monster> findAllMonsters() {
		return list;
		//return mongoOps.findAll(Monster.class);
	}

	public Monster findById(long id) {
		for(Monster model : list){
			if(model!=null && model.getId() == id){
				return model;
			}
		}
		return null;
	}

	public Monster findByName(String name) {
		for(Monster model : list){
			if(model!=null && model.getMonstername().equals(name)){
				return model;
			}
		}
		return null;
	}

	public long getNextId() {
		long nextId = id + 1;
		id++;
		return nextId;
	}

	public void saveMonster(Monster monster) {
		monster.setId(getNextId());
		list.add(monster);
	}

	public void updateMonster(Monster monster) {
		for(Monster model : list){
			if(model.getId() == monster.getId()){
				list.remove(model);
				list.add(monster);
			}
		}
		// Save is an "upsert" 
		//   ->if monster id does not exist, it will insert.
		//   ->if monster id does exist, it will update it.
		//mongoOps.save(monster);
	}

	public void deleteMonsterById(long id) {
		for(Monster model : list){
			if(model!=null && model.getId() == id){
				list.remove(model);
				break;
			}
		}
	}

	public boolean doesMonsterExist(Monster monster) {
		return findByName(monster.getMonstername()) != null;
	}

	public void deleteAllMonsters() {
		mongoOps.dropCollection(Monster.class);
	}
}
