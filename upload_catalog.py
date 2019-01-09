file_metadata = {
    'name': 'Figure Catalog',
    'mimeType': 'application/vnd.google-apps.spreadsheet'
}
media = MediaFileUpload('figure_catalog.xls',
                        mimetype='application/vnd.ms-excel',
                        resumable=True)
file = drive_service.files().create(body=file_metadata,
                                    media_body=media,
                                    fields='id').execute()
