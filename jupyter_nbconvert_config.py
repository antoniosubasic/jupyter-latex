c = get_config()

c.PDFExporter.latex_command = ["pdflatex", "{filename}"]

c.QtExporter.embed_images = True
c.QtPDFExporter.embed_images = True
c.PDFExporter.embed_images = True
c.WebPDFExporter.embed_images = True

c.PDFExporter.latex_count = 3
c.NbConvertApp.use_output_suffix = True
