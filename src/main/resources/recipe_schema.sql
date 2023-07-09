DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;

CREATE TABLE project (
  project_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  project_name VARCHAR(128) NOT NULL,
  estimated_hours DECIMAL(7,2),
  actual_hours DECIMAL(7,2),
  difficulty INT,
  notes TEXT
);
    
CREATE TABLE material (
  material_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  project_id INT NOT NULL,
  material_name VARCHAR(128) NOT NULL,
  num_required INT,
  cost DECIMAL(7,2),
  FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

CREATE TABLE step (
  step_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  project_id INT NOT NULL,
  step_text TEXT NOT NULL,
  step_order INT NOT NULL,
  FOREIGN KEY (project_id) REFERENCES project(project_id) ON DELETE CASCADE
);

CREATE TABLE category (
  category_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(128) NOT NULL
);

CREATE TABLE project_category (
   project_id INT NOT NULL,
  category_id INT NOT NULL,
  CONSTRAINT pk_project_category PRIMARY KEY (project_id, category_id),
  FOREIGN KEY (project_id) REFERENCES project(project_id),
  FOREIGN KEY (category_id) REFERENCES category(category_id)
);

INSERT INTO project (project_id, project_name, estimated_hours, actual_hours, difficulty, notes)
VALUES (1, 'My Project 1', 10.5, 12.3, 3, 'Some notes');

INSERT INTO category (category_name) VALUES ('Doors and Windows');

INSERT INTO material (project_id, material_name, num_required, cost)
VALUES (1, '2-inch screws', 20, 5.99);

INSERT INTO step (project_id, step_text, step_order)
VALUES (1, 'Screw door hangers on the top and bottom of each side of the door frame', 1);

INSERT INTO project_category (project_id, category_id)
VALUES (1, 1);