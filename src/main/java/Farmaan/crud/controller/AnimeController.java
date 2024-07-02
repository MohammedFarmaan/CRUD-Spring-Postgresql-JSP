package Farmaan.crud.controller;

import Farmaan.crud.service.AnimeService;
import Farmaan.crud.model.Anime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AnimeController {

    @Autowired
    AnimeService animeService;

    @GetMapping({"/", "/viewAnimeList"})
    public String viewAnimeList(@ModelAttribute("message") String message,Model model) {
        model.addAttribute("animeList",animeService.getAllAnime());
        model.addAttribute("message", message);
        return  "ViewAnimeList";
    }

    @GetMapping("/addAnime")
    public String addAnime(@ModelAttribute("message") String message,Model model) {
        model.addAttribute("anime", new Anime());
        model.addAttribute("message", message);
        return  "AddAnime";
    }

    @PostMapping("/saveAnime")
    public String saveAnime(Anime anime, RedirectAttributes redirectAttributes) {

        if(animeService.saveOrUpdateAnime(anime)) {
            redirectAttributes.addFlashAttribute("message", "Save Success");
            return "redirect:/viewAnimeList";
        }
        redirectAttributes.addFlashAttribute("message", "Save Failure");
        return "redirect:/addAnime";
    }

    @GetMapping("/editAnime/{id}")
    public String editAnime(@PathVariable Long id, Model model) {
        model.addAttribute("anime", animeService.getAnimeById(id));
        return "EditAnime";  // The name of your JSP file (without the .jsp extension)
    }

    @PostMapping("/editSaveAnime")
    public String editSaveAnime(Anime anime, RedirectAttributes redirectAttributes) {
        if(animeService.saveOrUpdateAnime(anime)) {
            redirectAttributes.addFlashAttribute("message", "Edit Success");
            return "redirect:/viewAnimeList";
        }
        redirectAttributes.addFlashAttribute("message", "Edit Failure");
        return "redirect:/editAnime/" + anime.getId();
    }

    @GetMapping("/deleteAnime/{id}")
    public String deleteAnime(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        if (animeService.deleteAnime(id)) {
            redirectAttributes.addFlashAttribute("message", "Delete Success");
        } else {
            redirectAttributes.addFlashAttribute("message", "Delete Failure");
        }
        return "redirect:/viewAnimeList";
    }

}
