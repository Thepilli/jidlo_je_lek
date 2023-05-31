import pytube
import requests
import os


def download_video_thumbnail(video_url, output_path):
    try:
        video = pytube.YouTube(video_url)
        thumbnail_url = video.thumbnail_url
        video_title = video.title
        video_filename = video_title.replace(' ', '_').replace(
            ':', '_').replace("'", "_") + ".mp4"
        thumbnail_filename = video_title.replace(
            ' ', '_').replace(':', '_').replace("'", "_") + ".jpg"

        video_path = os.path.join(output_path, video_filename)
        thumbnail_path = os.path.join(output_path, thumbnail_filename)

        # Create the output directory if it doesn't exist
        os.makedirs(output_path, exist_ok=True)

        # Download the video
        video.streams.get_highest_resolution().download(
            output_path=output_path, filename=video_filename)

        # Download the thumbnail image
        response = requests.get(thumbnail_url)
        response.raise_for_status()

        with open(thumbnail_path, "wb") as file:
            file.write(response.content)

        print("Video and thumbnail downloaded successfully!")
        print("Video saved at:", video_path)
        print("Thumbnail saved at:", thumbnail_path)

    except pytube.exceptions.RegexMatchError:
        print("Invalid YouTube URL!")

    except Exception as e:
        print("An error occurred:", str(e))


# List of video URLs
video_urls = [
    'https://youtu.be/pq2fiD0kqmc',
    'https://youtu.be/ax9uYL4TNKc',
    'https://youtu.be/xNfdTE8WNyI',
    'https://youtu.be/BAt7D7zlCbI',
    'https://youtu.be/kmChzsv7_PI',
    'https://youtu.be/E_bG4NAcwjg',
    'https://youtu.be/7DSfry6kcZE',
    'https://youtu.be/_6cOAcMrcQo',
    'https://youtu.be/fZzzukdhJSU',
    'https://youtu.be/OwUwN',
    'https://youtu.be/fos4Krwlmpg',
    'https://youtu.be/HfBRmY1zUPI',
    'https://youtu.be/I4huuyQEEUE',
    'https://youtu.be/RRfunj92HgA',
    'https://youtu.be/4ltMmH0tS_I',
    'https://youtu.be/ikIAO6xN4gs',
    'https://youtu.be/iKwZ_G_F_x0',
    'https://youtu.be/nECyeeQXOwI',
    'https://youtu.be/B77XXWJKQh8',
    'https://youtu.be/2n8jt',
    'https://youtu.be/A0Xm3vKfaW0',
    'https://youtu.be/6cMwhwNerYc',
    'https://youtu.be/v06ppwFw2vE',
    'https://youtu.be/PD5uNvbnP1U',
    'https://youtu.be/MDCvIEn1w98'
]

output_path = "C:\\Users\\jirip\\Documents\\thumbnails"

for url in video_urls:
    download_video_thumbnail(url, output_path)
    print()  # Add a newline between each iteration
