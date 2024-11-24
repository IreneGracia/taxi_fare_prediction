FROM tensorflow/tensorflow:2.10.0
COPY requirements_prod.txt requirements_prod.txt
RUN pip install --no-cache-dir -r requirements_prod.txt
COPY taxifare taxifare
COPY setup.py setup.py
RUN pip install .
COPY Makefile Makefile
RUN make reset_local_files
CMD uvicorn taxifare.api.fast:app --host 0.0.0.0 --port $PORT

