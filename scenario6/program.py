import curses
import xml.etree.ElementTree as ET

def load_data(file_path):
    tree = ET.parse(file_path)
    root = tree.getroot()
    return root

def get_recipes(root):
    recipes = []
    for recipe in root.findall('./recipes/recipe'):
        name = recipe.find('name').text
        description = recipe.find('description').text
        recipes.append((name, description))
    return recipes

def display_recipe_details(stdscr, recipe):
    stdscr.clear()
    stdscr.addstr(0, 0, recipe.find('name').text, curses.A_BOLD)
    stdscr.addstr(2, 0, "Description:")
    stdscr.addstr(3, 0, recipe.find('description').text)
    stdscr.addstr(5, 0, "Ingredients:")
    y = 6
    for ingredient_ref in recipe.findall('ingredients/ingredientRef'):
        stdscr.addstr(y, 0, "- " + ingredient_ref.text)
        y += 1
    stdscr.addstr(y + 1, 0, "Instructions:")
    stdscr.addstr(y + 2, 0, recipe.find('instructions').text)
    stdscr.addstr(y + 4, 0, "Prep Time: " + recipe.find('prepTime').text + " minutes")
    stdscr.addstr(y + 5, 0, "Cook Time: " + recipe.find('cookTime').text + " minutes")
    stdscr.addstr(y + 6, 0, "Servings: " + recipe.find('servings').text)
    stdscr.addstr(y + 7, 0, "Cuisine: " + recipe.find('cuisine').text)
    stdscr.addstr(y + 8, 0, "Calories: " + recipe.find('calories').text)
    stdscr.refresh()
    stdscr.getch()

def main(stdscr):
    curses.curs_set(0)
    root = load_data("../data.xml")
    recipes = get_recipes(root)

    current_row = 0
    while True:
        stdscr.clear()
        stdscr.addstr(0, 0, "Recipe Browser", curses.A_BOLD)
        for i, recipe in enumerate(recipes):
            if i == current_row:
                stdscr.addstr(i + 2, 0, recipe[0], curses.A_REVERSE)
            else:
                stdscr.addstr(i + 2, 0, recipe[0])
        stdscr.refresh()

        key = stdscr.getch()
        if key == curses.KEY_UP and current_row > 0:
            current_row -= 1
        elif key == curses.KEY_DOWN and current_row < len(recipes) - 1:
            current_row += 1
        elif key == curses.KEY_ENTER or key in [10, 13]:
            recipe_element = root.findall('./recipes/recipe')[current_row]
            display_recipe_details(stdscr, recipe_element)
        elif key == ord('q'):
            break

if __name__ == '__main__':
    curses.wrapper(main)