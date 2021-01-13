DROP TABLE book;
CREATE TABLE book(
  book_id INT NOT NULL PRIMARY KEY,
  description VARCHAR(256),
  price VARCHAR(256),
  author VARCHAR(256),
  title VARCHAR(256),
  category_id INT NOT NULL
);

ALTER TABLE book
MODIFY price decimal(6,2);

DROP TABLE category;
CREATE TABLE category(
  category_id INT NOT NULL PRIMARY KEY,
  category_name VARCHAR(256)
);


DROP TABLE review;
CREATE TABLE review(
  review_id INT NOT NULL PRIMARY KEY,
  rating INT,
  coment VARCHAR(256),
  data DATE,
  book_id INT NOT NULL
);

DROP TABLE usser;
CREATE TABLE usser(
  user_id INT NOT NULL PRIMARY KEY,
  user_type VARCHAR(256)
);

DROP TABLE basket;
CREATE TABLE basket(
  basket_id INT NOT NULL PRIMARY KEY,
  user_id INT NOT NULL
);

DROP TABLE book_in_basket;
CREATE TABLE book_in_basket(
  book_id INT,
  basket_id INT,
  quantity INT
);

ALTER TABLE book
ADD FOREIGN KEY (category_id) REFERENCES category(category_id);

ALTER TABLE review
ADD FOREIGN KEY (book_id) REFERENCES book(book_id);

ALTER TABLE basket
ADD FOREIGN KEY (user_id) REFERENCES usser(user_id);

ALTER TABLE book_in_basket
ADD FOREIGN KEY (book_id) REFERENCES book(book_id);

ALTER TABLE book_in_basket
ADD FOREIGN KEY (basket_id) REFERENCES basket(basket_id);

ALTER TABLE book_in_basket
ADD PRIMARY KEY (book_id, basket_id);

DESC book_in_basket;

INSERT INTO usser VALUES (1,'Admin');
INSERT INTO usser VALUES (2,'Colaborator');
INSERT INTO usser VALUES (3,'Utilizator inregistrat');
INSERT INTO usser VALUES (4,'Utilizator inregistrat');
INSERT INTO usser VALUES (5,'Utilizator neinregistrat');

select *
from usser;

INSERT INTO category VALUES (1,'Drama');
INSERT INTO category VALUES (2,'Horror');
INSERT INTO category VALUES (3,'Poezie');
INSERT INTO category VALUES (4,'Aventura');
INSERT INTO category VALUES (5,'Fantasy');

select *
from category;

desc book;

INSERT INTO book VALUES (1,'În vâltoarea celui de-al Doilea R?zboi Mondial, cinci tineri americani ideali?ti primesc câte o scrisoare misterioas? de la Oficiul pentru Servicii Strategice, în care li se pune întrebarea dac? sunt dispu?i s? lupte pentru ?ara lor.', 49.90, 'LEILA MEACHAM', 'Zborul libelulei', 1);
INSERT INTO book VALUES (2,'Sub conducerea dictatoriala a generalului Francisco Franco, Spania continua sa traiasca, dar redusa la tacere.', 256.90, 'RUTA SEPETYS', 'Fantanile tacerii', 1);
INSERT INTO book VALUES (3,'Noi, cei care putem citi, nu ne putem imagina cu ce greutati se confrunta acesti oameni în lumea scrisului în care traim cu totii.', 62.00, 'SEBASTIAN FITZEK', 'Cadoul', 2);
INSERT INTO book VALUES (4,'Cand Tommy si Tuppence o viziteaza pe batrana lor matusa intr-un azil de batrani, nu dau atentie prea mare nici motivelor ei de suparare, nici pacientei care se plange ca a fost otravita.', 34.90, 'AGATHA CHRISTIE', 'Tabloul', 2);
INSERT INTO book VALUES (5,'Natura cu a ei desavârsire si maretie, în fiecare zi ne zâmbeste oferind cadre mirifice, sublime, pline de culoare, iar noua nu ne râmâne decât ss le observam si sa-i raspundem tot cu un fermecator zâmbet.', 24.00, 'GEORGETA GANEA', 'Ea, Natura', 3);
INSERT INTO book VALUES (6,'Dupa ce a izbutit sa înfrânga monstrii care aproape ca i-au distrus lumea deosebit?, Jacob Portman s-a întors în casa parinteasca, în Florida.', 35.20, 'RANSOM RIGGS', 'Harta zilelor', 4);
INSERT INTO book VALUES (7,'Kyllar decide sa renunte la Calea Umbrelor si sa traiasca o viata linistita alaturi de Elene si de fiica lor adoptiva.', 35.20, 'BRENT WEEKS', 'Marginea umbrei', 5);
INSERT INTO book VALUES (8,'Casa lui Piranesi nu e deloc una obisnuita: are camere infinite, coridoare nesfârsite, peretii sunt ticsiti de mii si mii de statui, toate diferite.', 35.99, 'SUSANNA CLARKE', 'Piranesi', 5);
INSERT INTO book VALUES (9,'Ce legatura ar putea exista între o orfana de razboi, care nu-i nici frumoasa si nici educata, si Academia Militara de la Sinegard, cea mai prestigioasa institutie din Imperiul Nikan?', 35.20, 'R. F. KUANG', 'Razboiul macului', 5);
INSERT INTO book VALUES (10,'No description', 100.00, 'Anonymus', 'Us', 1);


select *
from book;

desc review;

INSERT INTO review VALUES (1, 5, 'O carte excelenta!', to_date('07-DEC-2020','DD-MON-YYYY'), 4);
INSERT INTO review VALUES (2, 1, 'Nu recomand!', to_date('01-JAN-2021','DD-MON-YYYY'), 1);
INSERT INTO review VALUES (3, 3, 'O carte mediocra.', to_date('30-NOV-2020','DD-MON-YYYY'), 5);
INSERT INTO review VALUES (4, 3, 'Nici super, nici meh.', to_date('06-DEC-2020','DD-MON-YYYY'), 8);
INSERT INTO review VALUES (5, 4, 'Aproape perfecta!', to_date('24-OCT-2020','DD-MON-YYYY'), 7);
INSERT INTO review VALUES (6, 2, 'Nota 2 cu indulgenta!', to_date('05-JAN-2021','DD-MON-YYYY'), 7);
INSERT INTO review VALUES (7, 5, 'Super!', to_date('14-FEB-2020','DD-MON-YYYY'), 2);

select * 
from review;

desc basket;

INSERT INTO basket VALUES (1,1);
INSERT INTO basket VALUES (2,2);
INSERT INTO basket VALUES (3,3);
INSERT INTO basket VALUES (4,3);
INSERT INTO basket VALUES (5,4);
INSERT INTO basket VALUES (6,5);
INSERT INTO basket VALUES (7,4);
INSERT INTO basket VALUES (8,1);
INSERT INTO basket VALUES (9,1);
INSERT INTO basket VALUES (10,2);

select *
from basket;

desc book_in_basket;

INSERT INTO book_in_basket VALUES (1,1,3);
INSERT INTO book_in_basket VALUES (1,3,2);
INSERT INTO book_in_basket VALUES (3,9,32);
INSERT INTO book_in_basket VALUES (7,10,9);
INSERT INTO book_in_basket VALUES (2,9,100);
INSERT INTO book_in_basket VALUES (3,2,77);
INSERT INTO book_in_basket VALUES (6,4,6);
INSERT INTO book_in_basket VALUES (5,5,43);
INSERT INTO book_in_basket VALUES (4,6,25);
INSERT INTO book_in_basket VALUES (8,7,11);
INSERT INTO book_in_basket VALUES (9,8,2);
INSERT INTO book_in_basket VALUES (10,6,1);

SET ECHO ON

select *
from book_in_basket;

--ex6:Afisati pe linii diferite top 3 autori pe anul pe anul 2020, luna decembrie, noiembrie si octombrie.
--Adica 3 autori random care au cartile in magazinul online facut.

select author
from book;

CREATE OR REPLACE PROCEDURE p6_paa IS
      TYPE Autor IS VARRAY(3) OF VARCHAR2(20);
    top Autor := Autor('GEORGETA GANEA', 'RUTA SEPETYS', 'SUSANNA CLARKE');
--am initializat vectorul
  
  PROCEDURE print_top (luna VARCHAR) IS
    BEGIN
      DBMS_OUTPUT.PUT_LINE('Pentru luna ' || luna || ':');
      FOR I IN 1..3 LOOP --afisarea in loop
        DBMS_OUTPUT.PUT_LINE('LOCUL ' || i || ' -> ' || top(i));
      END LOOP;
      DBMS_OUTPUT.PUT_LINE(' ');
    END;
BEGIN
  print_top('Decembrie');--afisez pe decembrie
  
  top := Autor('RUTA SEPETYS', 'R. F. KUANG', 'BRENT WEEKS'); --schimb toate valorile
  print_top('Noiembrie'); --afisez pe noiembrie
  
  top(1) := 'Anonymus'; --schimb 1 valoare
  print_top('Octombrie'); --afisez pe octombrie
END p6_paa;
/

--verificarea
BEGIN
  p6_paa;
END;
/
EXECUTE p6_paa;



select *
from book;
--ex7:Sa se afiseze pretul unei carti, dat fiind titlul acesteia.
CREATE OR REPLACE FUNCTION p7_paa (nume_carte IN VARCHAR) 
  RETURN INT IS pret NUMBER;
  CURSOR crs1 IS 
  SELECT price
  FROM book
  WHERE title = nume_carte;
BEGIN
  OPEN crs1;
  FETCH crs1 INTO pret;
  IF crs1%notfound THEN pret := 0;
  END IF;
  CLOSE crs1;
  RETURN pret;
END;
/
BEGIN
  DBMS_OUTPUT.PUT_LINE('Pretul ' || p7_paa('Cadoul') || ' il are cartea <Cadoul>');
END;
/
SELECT p7_paa('Cadoul') FROM DUAL;


select * from category;
select * from book;
select * from review;
select * from book_in_basket;
select * from basket;
select * from usser;

--ex8: Aflam cate categorii au carti cu rating cel putin 2. (dat fiind numele categoriei ca parametru)
--DRAMA = 1; HORROR = 1; POEZIE = 1; AVENTURA = 0; FANTASY = 3; (acestea sunt rezultatele)
CREATE OR REPLACE FUNCTION p8_paa (nume_categ category.category_name%TYPE)
  RETURN NUMBER IS produse book.book_id%TYPE;
  verif_existenta category.category_name%TYPE;
BEGIN
  SELECT category_name
  INTO verif_existenta
  FROM category
  WHERE category_name=nume_categ;
  
  SELECT COUNT(*)
  INTO produse
  FROM book
  JOIN review on book.book_id = review.book_id
  WHERE rating >= 2 and book.book_id IN (SELECT book.book_id
                        FROM book
                        JOIN category on category.category_id=book.category_id
                        WHERE category.category_name = nume_categ);
  RETURN produse;
EXCEPTION
  WHEN no_data_found THEN
    raise_application_error(-20000, 'Categoria nu exista');
  WHEN OTHERS THEN
    raise_application_error(-20001, 'Eroare');
END p8_paa;
/

DECLARE 
  nume_categorie category.category_name%TYPE := 'Fantasy';
BEGIN
  DBMS_OUTPUT.PUT_LINE('Categoria ' || nume_categorie || ' contine ' || p8_paa(nume_categorie) || ' carti cu rating cel putin 2.');
END;
/
SELECT p8_paa('Horror') FROM DUAL;

--ex9:Userul afla numele categoriei unui produs comandat, daca are o singura comanda!
--se vor utiliza tabelele: category, book, book_in_basket, basket, user.

CREATE OR REPLACE PROCEDURE p9_paa (
    c_id IN usser.user_id%TYPE)
  AS
  categ category.category_name%TYPE;
BEGIN    
  SELECT category.category_name
  INTO categ 
  FROM category
  WHERE category_id = (SELECT book.category_id
                       FROM book
                       WHERE book.book_id = (SELECT book_in_basket.book_id
                                             FROM  book_in_basket
                                             WHERE  book_in_basket.basket_id = (SELECT basket.basket_id
                                                                                FROM  basket
                                                                                WHERE  basket.user_id = (SELECT usser.user_id
                                                                                                         FROM  usser
                                                                                                         WHERE  usser.user_id = c_id
                                                                                                         )
                                                                                )
                                            )
                      );
  DBMS_OUTPUT.PUT_LINE(categ);
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20000, 'Nu exista userul/categoria in baza de date');
    WHEN OTHERS THEN
        raise_application_error(-20002, 'Are mai multe cosuri de cumparaturi');
END p9_paa;
/
--Apelare 9
ALTER PROCEDURE p9_paa compile;

/
EXEC p9_paa(5);
/--Totul e ok
/
EXEC p9_paa(2);
/--User cu mai multe cosuri de cumparaturi
/
EXEC p9_paa(6);
/--User care nu exista

DELETE FROM book_in_basket
WHERE book_id = 10 AND basket_id =6;

select * from book;
desc book;
--ex10:Inserez book cu permisiune

SET SERVEROUTPUT ON;

CREATE OR REPLACE TRIGGER new_book
BEFORE INSERT ON book
BEGIN
  DBMS_OUTPUT.PUT_LINE('Ati adaugat o carte noua in baza de date!');
END;
/
ALTER TRIGGER new_book ENABLE;
/
ALTER TRIGGER new_book DISABLE;
/

INSERT INTO book(book_id, description, price,author,title,category_id)
VALUES (11,'Descriere goala', 24.00, 'Student', 'ASMI', 2);
/

DELETE FROM book
WHERE book_id = 11;
/

--ex11:Select o carte dupa book_id si incerc sa ii modific pretul sa fie peste 500.

CREATE OR REPLACE TRIGGER max_price BEFORE
  UPDATE OF price ON book
  FOR EACH ROW 
BEGIN 
  IF( :new.price >= 500 ) THEN
    raise_application_error(-20002, 'Nu se poate creste pretul cartii peste 500');
  END IF;
END;
/
--Triggerul se declanseaza la modificarea pretului unei carti

UPDATE book
SET price = 999
Where book_id = 10;
/
select price
from book;
rollback;
/
ALTER TRIGGER max_price ENABLE;
/
ALTER TRIGGER max_price DISABLE;
/

--ex12: creez o tabela audit_proiect si un trigger care sa refuze stergerea unei tabele din db.
--Apoi am dezactivat triggerul si am sters tabela.

show user;
/
CREATE OR REPLACE TRIGGER deny
  BEFORE DROP ON DATABASE
BEGIN
  raise_application_error(-20002, 'Nu aveti permisiunea de a sterge tabele!');
END;
/
ALTER TRIGGER deny disable;

--Creez tabela audit_proiect pt a testa
CREATE TABLE audit_proiect(
  dt DATE,
  ceva_random VARCHAR(256)
);
/
--acum incerc sa sterg si declansez triggerul
DROP TABLE audit_proiect;
/

