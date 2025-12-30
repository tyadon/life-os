---
description: Sync travel confirmations from email to travel files
argument-hint: [trip-name]
allowed-tools: Read, Write, Edit, Glob, Grep, mcp__google-workspace__search_gmail_messages, mcp__google-workspace__get_gmail_message_content, mcp__google-workspace__create_event
---

# Travel Sync

Pull travel confirmation emails and update trip files.

<!-- ONBOARDING: Replace with user's travel confirmation account from /reference/system-config.md -->
**Account**: your.personal@gmail.com (personal - where travel confirmations go)

## Process

### 1. Identify Target Trip

If $ARGUMENTS provided:
- Find matching trip in `/travel/upcoming/`

If no argument:
- List upcoming trips from `/travel/upcoming/`
- Ask: "Which trip should I sync confirmations for?"

### 2. Get Trip Details

Read the trip file to understand:
- Destination
- Dates
- What's already confirmed
- What's still needed

### 3. Search for Confirmations

Search personal email for travel-related confirmations:

```
mcp__google-workspace__search_gmail_messages
  user_google_email: your.personal@gmail.com
  query: "subject:(confirmation OR itinerary OR booking OR reservation) [destination] newer_than:60d"
  page_size: 20
```

Also search common travel senders:
```
mcp__google-workspace__search_gmail_messages
  user_google_email: your.personal@gmail.com
  query: "from:(united OR delta OR american OR southwest OR jetblue OR marriott OR hilton OR airbnb OR vrbo OR expedia OR kayak OR hotels.com) newer_than:60d"
  page_size: 20
```

### 4. Extract Confirmation Details

For each confirmation email found, extract:

**Flights**:
- Airline
- Flight number
- Confirmation code
- Date/time (departure and arrival)
- Route (origin → destination)
- Seat assignment (if available)

**Hotels/Accommodation**:
- Property name
- Confirmation number
- Check-in / Check-out dates and times
- Address
- Contact number

**Car Rental**:
- Company
- Confirmation number
- Pick-up / Drop-off location and time
- Vehicle type

**Activities/Reservations**:
- Restaurant name / Activity
- Confirmation number
- Date/time
- Party size
- Address

### 5. Present Findings

```
## 📄 CONFIRMATIONS FOUND for [Trip Name]

### ✈️ Flights

**Outbound**: [Date]
- [Airline] [Flight#] | [Departure Time] → [Arrival Time]
- [Origin] → [Destination]
- Confirmation: [Code]
- Seat: [if known]

**Return**: [Date]
- [Airline] [Flight#] | [Departure Time] → [Arrival Time]
- [Destination] → [Origin]
- Confirmation: [Code]

### 🏨 Accommodation

**[Property Name]**
- Check-in: [Date] at [Time]
- Check-out: [Date] at [Time]
- Confirmation: [Code]
- Address: [Address]
- Phone: [Number]

### 🚗 Car Rental

**[Company]**
- Pick-up: [Date] [Time] at [Location]
- Drop-off: [Date] [Time] at [Location]
- Confirmation: [Code]
- Vehicle: [Type]

### 🎟️ Activities/Reservations

- **[Activity/Restaurant]**: [Date] [Time] - Confirmation: [Code]

---

**Update trip file with these details?** (y/n)
```

### 6. Update Trip File

If confirmed, update `/travel/upcoming/[trip-name].md`:

Add to Confirmations section:
```markdown
## Confirmations

### Flights
| Segment | Flight | Date | Time | Confirmation |
|---------|--------|------|------|--------------|
| Outbound | [Airline] [#] | [Date] | [Dep]-[Arr] | [Code] |
| Return | [Airline] [#] | [Date] | [Dep]-[Arr] | [Code] |

### Accommodation
- **[Property]**: [Check-in] to [Check-out]
- Confirmation: [Code]
- Address: [Address]

### Transportation
- **[Company]**: [Dates]
- Confirmation: [Code]
```

### 7. Add to Calendar (Optional)

After updating trip file:

"Want me to add these to your personal calendar?"

If yes, offer to create events for:
- [ ] Flight departure
- [ ] Flight arrival
- [ ] Hotel check-in
- [ ] Hotel check-out
- [ ] Car pick-up
- [ ] Car drop-off
- [ ] Reservations

For each selected, create event:
```
mcp__google-workspace__create_event
  user_google_email: your.personal@gmail.com
  summary: "[Type]: [Details]"
  start_time: [RFC3339]
  end_time: [RFC3339]
  description: "Confirmation: [Code]\n[Additional details]"
  location: [if applicable]
```

**ONLY create events with explicit approval.**

### 8. Summary

```
## ✅ TRAVEL SYNC COMPLETE

**Trip**: [Name]
**Dates**: [Date range]

### Updated
- Trip file: `/travel/upcoming/[trip].md`
- Confirmations added: [count]
- Calendar events: [count created]

### Still Needed
- [ ] [Any missing confirmations identified]
- [ ] [Things to book]

### Packing Reminder
Trip is in [X] days. Don't forget to:
- Review packing list: `/travel/packing-lists/[domestic|international].md`
- Check weather forecast
- Confirm transportation to airport
```

## Missing Confirmation Detection

If expected confirmations not found:
- "No flight confirmation found for [dates]. Is it booked?"
- "No hotel for [destination]. Need to book?"

Flag in trip file under "Still Needed" section.
