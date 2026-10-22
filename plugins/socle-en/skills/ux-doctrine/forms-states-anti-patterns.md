# Forms, states, action feedback, anti-patterns

## Forms

- **Label** always visible, above the control, never replaced by an example.
  "(optional)" marks the exception; required is not marked.
- **Help**: one sentence at most, between label and control, linked by
  `aria-describedby`.
- **Error** at the field, below the control, in words, with the useful example;
  never only at the top of the page or only by colour. Input is kept.
- **Validation** on submit, then at the field as soon as it is corrected; no
  scolding while typing. The server always revalidates.
- **Buttons**: one main action, named by its verb; "Cancel" second, not filled.
  While submitting, the button says so and does not submit twice.
- **Destructive action**: outlined, away from the main action, its label names
  the object ("Delete the customer").
- **Confirmation** only for the irreversible or the costly: a title that names
  the object, text that states the consequence, a button that names the act,
  focus on "Cancel". A reversible action is not confirmed: it is undone
  ("Archived · Restore").
- **Long form**: the choice that decides the fields comes first.
- ✓ Submit the empty form: each faulty field carries its error, input is
  intact, focus is on the first faulty field.

## Interface states

One anatomy: icon, title, one sentence, one action.

| State | Rule |
|---|---|
| Empty | "No data" offers to create; "No results" offers to reset |
| Loading | carries a text; a skeleton if the shape is known |
| Error | within its scope; cause in words, consequence, action; reference collapsed; "Help" next to it |
| Success | a page only if the outcome has its own page; otherwise a toast or a banner |
| Unavailable | on the affected function, not the whole page; says what still works and the date of the last data |
| Access denied | names the recognised account and the action that would open access; does not send a signed-in person back to sign-in |

A state is never recognisable by colour alone.

## Action feedback: one channel per consequence

| Channel | When |
|---|---|
| At the field | error or state of a field, a section |
| Toast | ordinary successful action, nothing to reread |
| Banner | result or warning that must stay visible |
| Dialog | blocking decision, error that prevents, detailed result |
| Page | outcome that changes what one can do, or an addressable result |

One polite live region per screen. Signing out also has feedback.

## Dialogs

- `alert()`, `confirm()`, `prompt()` are never an interface mechanism:
  `<dialog>` opened by `showModal()`.
- Defined initial focus, trapped, restored to the trigger; Escape closes except
  while submitting; inert background; `alertdialog` for destructive actions.
- No modal for: a long form, content shareable by address, information without
  a decision, a record viewed while handling a map.

## System pages

A browser always receives HTML: never a framework's default page, never an
API's JSON. Error, maintenance, expired session and access denied have their own
page, in words, with "Help".

## Technical constraints

- No inline style or script (strict CSP policy); no colour written in a page:
  classes and tokens.
- No invented design system class; no local redefinition of a shared block.

## Anti-patterns

| Anti-pattern | Instead |
|---|---|
| A global "Menu" that duplicates navigation | navigation by objects; contextual link to the related object |
| A "how this screen works" paragraph | clear labels, collapsed help |
| A diagnostic table on the use screen | Operations space |
| Two menus for the same function | one main path |
| "Continue with <identity service>" | "Sign in" |
| An "Admin" entry visible to all, greyed out | absent without the right |
| An icon alone for an ambiguous action | icon + label |
| `alert()` / `confirm()` | `dialog` |
| Version and commit in a public showcase's footer | a "Version" link to a dedicated page |
| A footer listing every product | four zones at most |
| Footer, account menu or state written by hand | the shared blocks |
| "Contact", "Feedback", "Support" and "Help" together | "Help" |
| A public screen that looks like a console | administration or operations space |
| A permanent "Production" badge | only Test and Local identify themselves |
| A configuration variable displayed when missing | "… is not configured" + "Help"; the variable in the log |
| "Import failed (503)" | "… not available at the moment" + freshness + "Help" |
