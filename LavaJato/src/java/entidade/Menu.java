
package entidade;

import lombok.*;

@Getter
@Setter
public class Menu {
    
    private int id_menu;
    private String menu;
    private String link;
    
    public Menu() {
    
    }

    public Menu(int id_menu, String menu, String link) {
        this.id_menu = id_menu;
        this.menu = menu;
        this.link = link;
    }
    
    
    
}
