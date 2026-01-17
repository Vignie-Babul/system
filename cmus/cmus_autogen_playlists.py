from collections.abc import Iterator
import os


HOMEDIR = os.path.expanduser('~')
MUSIC_DIR = f'{HOMEDIR}/audio/music'
CMUS_PLAYLISTS_DIR = f'{HOMEDIR}/.config/cmus/playlists'


def is_dir_exists(path: str) -> bool:
	if not os.path.isdir(path):
		print(f"'{path}': No such directory")
		return False

	return True

def get_subdirs_abs_paths(path: str) -> Iterator[str]:
	for dir in sorted(os.listdir(path)):
		yield os.path.join(path, dir)

def write_playlist(filepath: str, songs: list[str]) -> None:
	with open(filepath, 'w') as playlist:
		print(*songs, sep='\n', file=playlist)
		print(f"Created '{filepath}'")

def main(music_dir: str, pl_dir: str) -> None:
	if not is_dir_exists(pl_dir) or not is_dir_exists(music_dir):
		return

	sorted_subdirs = sorted(os.listdir(music_dir))
	for subdir in sorted_subdirs:
		music_abs_path = os.path.join(music_dir, subdir)
		if not is_dir_exists(music_abs_path):
			return
		pl_abs_path = os.path.join(pl_dir, subdir)

		songs = get_subdirs_abs_paths(music_abs_path)
		only_file_songs = filter(os.path.isfile, songs)
		write_playlist(pl_abs_path, only_file_songs)


if __name__ == '__main__':
	main(MUSIC_DIR, CMUS_PLAYLISTS_DIR)
