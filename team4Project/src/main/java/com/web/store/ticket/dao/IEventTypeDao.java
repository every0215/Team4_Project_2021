package com.web.store.ticket.dao;

import com.web.store.ticket.model.EventType;

public interface IEventTypeDao {
	EventType queryEventType(int eventTypeId);
}
