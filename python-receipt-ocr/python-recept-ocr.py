import requests

print("=== Python Receipt OCR using API")
#Guide http://asprise.com/ocr/api/docs/html/receipt-ocr.html

receiptOcrEndpoint = 'https://ocr.asprise.com/api/v1/receipt' # Receipt OCR API endpoint
imageFile = "python-receipt-ocr/img/1.jpg" # // Modify this to use your own file if necessary
r = requests.post(receiptOcrEndpoint, data = { \
  'client_id': 'TEST',        # Use 'TEST' for testing purpose \
  'recognizer': 'auto',       # can be 'US', 'CA', 'JP', 'SG' or 'auto' \
  'ref_no': 'ocr_python_123', # optional caller provided ref code \
  }, \
  files = {"file": open(imageFile, "rb")})

print(r.text) # result in JSON