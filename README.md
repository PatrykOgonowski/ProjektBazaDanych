1. System rezerwacji wizyt u fryzjera / kosmetyczki

Opis:
Klient wybiera usługę, specjalistę i termin, a właściciel widzi rezerwacje.

5 tabel:

uzytkownicy(id_uzytkownika, imie_nazwisko, email, haslo, rola)

uslugi(id_uslugi, nazwa, czas_trwania, cena)

pracownicy(id_pracownika, imie_nazwisko, specjalizacja)

wizyty(id_wizyty, id_uzytkownika, id_pracownika, id_uslugi, data_wizyty, status)

opinie(id_opinii, id_uzytkownika, id_pracownika, ocena, komentarz)

GUI:
-Formularz rezerwacji

-Lista usług

-Podgląd wizyt użytkownika

-Panel administratora

-------------------------------------------------------------------------------------

2. System zgłoszeń serwisowych dla komputerów i laptopów

Opis:
Użytkownicy zgłaszają problemy, a technicy je rozwiązują.

5 tabel:

uzytkownicy(id_uzytkownika, imie_nazwisko, rola, haslo)


zgloszenia(id_zgloszenia, id_uzytkownika, id_kategorii, tytul, opis, status, data_zgloszenia)


kategorie(id_kategorii, nazwa)


komentarze(id_komentarza, id_zgloszenia, id_uzytkownika, wiadomosc, data)


zalaczniki(id_zalacznika, id_zgloszenia, nazwa_pliku, data_dodania)

GUI:
-Formularz zgłoszenia
-Lista zgłoszeń z filtrami
-Podgląd zgłoszenia i komentarze

-------------------------------------------------------------------------------------

3. System ocen i frekwencji uczniów

Opis:
Aplikacja dla nauczycieli do wprowadzania ocen i obecności oraz dla uczniów – do ich przeglądania.

5 tabel:

uzytkownicy(id_uzytkownika, imie_nazwisko, rola, haslo)

przedmioty(id_przedmiotu, nazwa)

oceny(id_oceny, id_uzytkownika, id_przedmiotu, wartosc, data)

frekwencja(id_frekwencji, id_uzytkownika, id_przedmiotu, data, obecny)

nauczyciele(id_nauczyciela, imie_nazwisko, email, telefon)

GUI:
-Logowanie (uczeń / nauczyciel / administrator)
-Nauczyciel: dodawanie ocen i obecności
-Uczeń: przegląd ocen i obecności
-Administrator: zarządzanie kontami
