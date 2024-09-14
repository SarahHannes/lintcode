create procedure addTeachers()
begin -- start function definition

    -- declare variables
    declare i int default 1;
    declare name varchar(200);
    declare email varchar(500);
    declare age int;

    -- loop
    while i <= 30000 do
        -- set variables
        set name = concat("teacher", i * 1);
        set email = concat(name, "@chapter.com");
        set age = (26 + (i % 20));

        -- add to table
        insert into teachers(id, name, email, age, country)
        values (i, name, email, age, "");

        set i = i + 1;
    end while;
    -- end loop

end;  -- end function definition


