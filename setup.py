from setuptools import setup, find_packages

with open('requirements_mctest.txt', 'r') as f:
    requirements = [line.strip() for line in f.readlines() if not line.startswith('#')]

#subprocess.call(['/bin/bash', './_setup-all.sh'])

setup(
    name='mctest',
    version='5.3',
    packages=find_packages(),  # automatically discover and include all packages in the package directory
    install_requires=requirements,
    include_package_data=True,  # include non-python files specified in MANIFEST.in
    url='vision.ufabc.edu.br',
    license='LGPL',
    author='fz',
    author_email='fzampirolli@ufabc.edu.br',
    description='Generator and Corrector Exams',
    classifiers=[
        # classifiers help users find your project on PyPI
        'Development Status :: 4 - Beta',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: GNU Lesser General Public License v3 (LGPLv3)',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.10',
        'Framework :: Django',
        'Topic :: Education :: Testing',
    ],
    zip_safe=False,
    keywords='django exams generator corrector',
    # if there are any scripts or executables, include them here
    scripts=['./_setup-all.sh'],
    # or using entry_points
    # entry_points={
    #     'console_scripts': [
    #         'yourscript = yourpackage:main_function',
    #     ],
    # },
)

