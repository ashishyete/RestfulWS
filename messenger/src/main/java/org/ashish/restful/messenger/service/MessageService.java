/**
 * 
 */
package org.ashish.restful.messenger.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.ashish.restful.messenger.database.DatabaseClass;
import org.ashish.restful.messenger.model.Message;

/**
 * @author Ashish
 *
 */
public class MessageService {
	
	private Map<Long,Message> messages = DatabaseClass.getMessages(); 

	/*public List<Message> getAllMessages() {
		List<Message> al = new ArrayList<>();
		Message m1 = new Message(1L, "Hi Ashish", "Ashish");
		Message m2 = new Message(2L, "Hi Nidhi", "Ashish");
		al.add(m1);
		al.add(m2);
		return al;
	}*/
	
	public MessageService() {
		messages.put(1L, new Message(1, "Hi Ashish", "Ashish"));
		messages.put(2L, new Message(2, "Hi Nidhi", "Ashish"));
	}
	

	public List<Message> getAllMessages() {
		return new ArrayList<Message>(messages.values());
	}

	public Message getMessage(Long id) {
		return messages.get(id);
	}

	public Message removeMessage(Long id) {
		return messages.remove(id);
	}

	public Message addMessage(Message message) {
		message.setId(messages.size() + 1);
		messages.put(message.getId(), message);
		return message;
	}

	public Message updateMessage(Message message) {

		if (message.getId() <= 0) {
			return null;
		}
		messages.put(message.getId(), message);
		return message;
	}
	
}
