import cv2

alg = r"C:\Users\Nilanjan\OneDrive - uem.edu.in\innovative Projects\wakey wakey\haarcascade_frontalface_default.xml"
haar_cascade = cv2.CascadeClassifier(alg)

file_name = r"C:\Users\Nilanjan\OneDrive - uem.edu.in\innovative Projects\wakey wakey\pic.jpg"
img = cv2.imread(file_name, 0)  # Read the image in grayscale
# No need to convert to grayscale again, as it's already in grayscale

faces = haar_cascade.detectMultiScale(
    img, scaleFactor=1.05, minNeighbors=2, minSize=(100, 100)
)

i = 0
for x, y, w, h in faces:
    cropped_image = img[y: y + h, x: x + w]
    target_file_name = 'str/' + str(i) + '.jpg'
    cv2.imwrite(target_file_name, cropped_image)
    i += 1
