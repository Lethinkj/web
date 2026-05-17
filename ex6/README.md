# 6th Experiment - XML with DTD and CSS (Student Records)

## Aim
Create an XML document for student details and:
- validate structure using DTD
- format display using CSS stylesheet

## Files in This Experiment
```text
ex6/
├── student.xml   (Main XML data)
├── student.dtd   (Document Type Definition)
└── student.css   (Styling for XML display)
```

## How to Run
This is an XML/CSS exercise, so no Tomcat is required.

### Linux/macOS
1. Start a local static server from project root:
```bash
cd /home/lethin/projects/backup/web/web
python3 -m http.server 8000
```

2. Open in browser:
```text
http://localhost:8000/ex6/student.xml
```

### Windows (CMD)
1. Start server from project root:
```bat
cd \path\to\web
py -m http.server 8000
```

2. Open:
```text
http://localhost:8000/ex6/student.xml
```

## Optional Validation
Check XML well-formedness:
```bash
xmllint --noout ex6/student.xml
```

## Expected Output
- Browser displays student records from XML
- CSS colors/styles are applied to tags like `sno`, `sname`, `address`, `m1`, `m2`, `m3`

## Common Issues
- Raw XML shown without styles: ensure `<?xml-stylesheet type="text/css" href="student.css"?>` is present.
- File not found: verify URL is exactly `/ex6/student.xml`.
- Styles not updating: hard-refresh browser (`Ctrl+F5`).
