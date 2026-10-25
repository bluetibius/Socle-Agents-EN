---
name: ux-doctrine
description: Generic UX/UI doctrine — principles and their order, four spaces (use, settings, administration, operations), minimal text, progressive complexity, one function one path, navigation, account area, footer, icons, responsive, states, forms, action feedback, anti-patterns. Load to design, change or review an interface, and used by the design-system-compliance, declutter-review and finish-inspector agents. The project's design system takes precedence over these rules.
---

# UX doctrine

A default doctrine. The project's design system and doctrine, named by the
profile, **take precedence**; these rules fill what they do not say. Details of
forms, states, feedback and anti-patterns:
[forms-states-anti-patterns.md](forms-states-anti-patterns.md).

## 1. Principles, in the order in which they decide

1. **The journey first**: the screen shows what serves this person, now —
   action, useful information, result, obvious navigation.
2. **The person stays in their application**: signing in, getting help,
   reporting a problem are capabilities of the application, under its brand,
   not visits to named technical tools.
3. **True, and said in words**: a label says what the action does; an absence
   states its reason; no technical code is the only explanation.
4. **One word, one thing**: a cross-cutting concept carries the same name
   everywhere (lexicon).
5. **Remove before adding**: delete → simplify → move → existing convention →
   design system component → creation.

Simplification **never** removes: accessible label, keyboard, contrast, visible
focus, text alternative, understanding without colour. It does not standardise
identity, a tool's legitimate density, or the business domain.

## 2. Hierarchy and spaces

| Kind of screen | Order |
|---|---|
| Use | what the person comes to find or do → the result → what changes their decision → the rest, collapsed |
| Internal tool | **state → action → problem → technical details** |

Each screen belongs to **one** space:

| Space | For whom | Never contains |
|---|---|---|
| Use | whoever uses the application | scheduled tasks, technical provenance, checksums, commands, variables, permission identifiers |
| Settings | the same person, for themselves | managing other people |
| Administration | whoever manages people, catalogue, permissions | the installation's health |
| Operations | whoever runs the product | — (legitimate density) |

A public interface does not look like a console. Administration has its own
navigation and adds nothing to the use navigation.

## 3. Text

- A use screen carries **at most one sentence** of orientation, and only if its
  labels are not enough.
- Anything longer, in order of preference: the label itself → field help → a
  tooltip → a collapsed "How it works" section → the documentation.
- Never on a use screen: the name of an internal component as a cause, a
  command, an environment variable, a documentation path, a raw enumeration
  value, implementation jargon ("ingestion").
- **One language on screen**: the interface's. A proper noun that has a form
  in that language is shown in that form alone; its other forms serve search,
  not display. Typography follows that language (spacing, quotes, apostrophes,
  capitals).
- ✓ Removing a use screen's paragraphs removes no capability.

## 4. Progressive complexity

- At first glance: the object, its state, the main action. Advanced options,
  fine settings and provenance open on demand ("Details", "Where this
  information comes from").
- A function is shown only to whoever can use it; an impossible action is
  **absent** (not greyed out) and, if its absence is surprising, explained.
- At most **three** visible filters; the others behind "More filters", active
  criteria as chips.

## 5. One function, one path

- A function has **one** main path. A second access (a shortcut from the
  object) leads to the **same** screen, never to a second form.
- One business action = one form; one dataset = one workspace.
- The breadcrumb uses the word of the navigation entry it points to.
- ✓ List each function's entry points: more than one without justification = a
  deviation.

**Search and browsing filters**: updated in the page while typing when the cost
allows; debounced input, stale responses ignored, loading, empty and error
announced, focus, keyboard and URL preserved; a form usable without JavaScript.
No write while typing; a committing validation stays explicit.

## 6. Navigation

- The main navigation names the **business objects**, nothing else; beyond seven
  entries in a group, regroup.
- **No catch-all global menu** nor a menu listing other products; a link to a
  related product exists only where it serves the task, and leads to the object.
- Secondary navigation: the current object's, never a second global bar.
- Every secondary screen offers a way back to its parent.
- Every choice that changes the view (filter, period, selection, position) is in
  the address; reloading restores the view.
- Internal navigation does not open a new tab; same grouping at every width.

## 7. Header, account area, footer

- **Header**: identity of the served application → main navigation → central
  tool if search **is** the use → account area, always last. No links to other
  products, no version, documentation or legal notices. Test and Local may
  identify themselves; production does not.
- **Account area**: signed out → "Sign in" (or an avatar that opens it); signed
  in → name, then granted spaces (one per space, never per permission), "My
  account", "Help", "Sign out", in this order. Administration and operations
  exist only for whoever is entitled to them. Signing out stays two actions away
  on a phone. An access refusal for the active account offers "Switch account".
- **Footer**: four zones at most — identification, help ("Help"), notices if
  needed, version (a link to a dedicated page on a public product; a discreet
  mention in a signed-in space or internal tool). No list of products, repeated
  navigation, or explanatory text.
- **A single help door**: "Help". No "Contact", "Feedback" or "Support" next to
  it. "Report a problem" accompanies it if contextual reporting exists; no
  screenshot attached on sensitive screens. The address comes from
  configuration, never from the template.

## 8. Icons and logos

- An icon alone only for a meaning that is universal in context (close, search,
  back, more actions, zoom, copy); it carries an accessible name and a tooltip.
- An ambiguous, destructive or rare action keeps its label.
- Two entries do not share an icon; an icon never carries a state on its own.
- One set, one stroke; an icon next to a label is decorative (`aria-hidden`).
  The touch target is held by the button.
- **Logos**: a logo that already carries the name is not doubled by the name
  in text; the name remains its accessible name. A series of logos shares
  height, margin and background treatment, and stays readable in each theme.

## 9. Responsive and accessibility

- On a phone, the order follows use: what one comes to find is on the first
  screen. Mobile is not a mechanical shrinking of the desktop.
- 44 px targets, nothing essential on hover, main action visible above the
  keyboard.
- List → labelled cards; dialog → bottom sheet; filters → collapsed with chips;
  an internal tool keeps its columns and scrolls within its frame.
- Check at 375, 768, 1024 and 1440 px (and a large screen if the product is
  displayed on one). WCAG 2.2 AA, 200 % zoom, reduced motion.

## 10. Brand and shared structure

- What varies per brand: logo, name, colours, typography, tone. What does not:
  header order, account menu, footer zones, anatomy of states and fields,
  lexicon, keyboard.
- A structural component contains no hard-coded brand name or colour; identity
  goes through the theme, never by overriding a component.
- A shared block **replaces** its local variant; vendored copies are not
  modified; what stays local is declared.
- A product's business particularity does not become a shared pattern because
  it exists.
